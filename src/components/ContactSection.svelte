<!-- <script lang="ts">
    import { variables } from '$lib/variables';

  import { SvelteToast, toast } from '@zerodevx/svelte-toast';

  import { createForm } from 'felte';
  import { reporter, ValidationMessage } from '@felte/reporter-svelte';

  import { validator } from '@felte/validator-zod';
  import { z } from 'zod';

  const schema = z.object({
      name: z.string().min(1),
      email: z.string().email().min(1),
      message: z.string().min(1)
  });

  function failedToast() {
      toast.push('Error sending message, please try again later.', {
          theme: {
              '--toastBackground': '#F56565',
              '--toastBarBackground': '#C53030'
          }
      });
  }

  const { form, isValid, reset } = createForm({
      onSubmit: async (values) => {
          try {
              const res: Response = await fetch(
                  `${variables.contactFormBasePath}/contact`,
                  {
                      method: 'POST',
                      body: JSON.stringify({
                          toAddresses: [values.email],
                          ccAddresses: [],
                          bccAddresses: [],
                          subject: `Test Contact Form From App - ${values.name}`,
                          body: values.message
                      })
                  }
              );

              if (res.ok) {
                  reset();
                  toast.push('Message Sent');
              } else {
                  console.error('Not ok response from contact form: ' + res.status);
                  failedToast() 
              }
          } catch (e) {
              console.error('Failed to send contact form email', e);
              failedToast() 
          }
      },
      extend: [reporter, validator({ schema })]
  });

</script>


<section class="bg-gray-50 py-20">
  <div class="container my-0 mx-auto px-4 max-w-6xl">
      <div class="flex items-center justify-center h-20">
          <h1 class="text-6xl title-text relative pb-1">Contact Us</h1>
      </div>

      <form use:form>
          <div class="form-control w-full ">
              <label for="name-input" class="label">
                  <span class="label-text">Name</span>
              </label>
              <input
                  id="name-input"
                  type="text"
                  name="name"
                  placeholder="Enter Name"
                  class="input input-bordered w-full"
              />
              <ValidationMessage for="name" let:messages>
                  <label class="label" for="name">
                      <span class="label-text-alt text-red-500">{messages?.[0] || ''}</span>
                  </label>
              </ValidationMessage>
          </div>

          <div class="form-control w-full ">
              <label for="email-input" class="label">
                  <span class="label-text">Email</span>
              </label>
              <input
                  id="email-input"
                  type="email"
                  name="email"
                  placeholder="Enter Email"
                  class="input input-bordered w-full"
              />

              <ValidationMessage for="email" let:messages>
                  <label class="label" for="email">
                      <span class="label-text-alt text-red-500">{messages?.[0] || ''}</span>
                  </label>
              </ValidationMessage>
          </div>

          <div class="form-control">
              <label for="message-input" class="label">
                  <span class="label-text">Messgae</span>
              </label>
              <textarea
                  id="message-input"
                  type="text"
                  name="message"
                  class="textarea textarea-bordered h-24"
                  placeholder="Enter Message"
              />
              <ValidationMessage for="message" let:messages>
                  <label class="label" for="message">
                      <span class="label-text-alt text-red-500">{messages?.[0] || ''}</span>
                  </label>
              </ValidationMessage>
          </div>

          <div class="pt-2 w-full text-right">
              <button type="submit" disabled={!$isValid} class="btn">Send</button>
          </div>
      </form>
  </div>
</section>

<SvelteToast />

<style>
  .title-text::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      height: 2px;
      width: 300px;
      background-color: #ffc107;
  }

  :root {
      --toastContainerTop: auto;
      --toastContainerRight: auto;
      --toastContainerBottom: 8rem;
      --toastContainerLeft: calc(50vw - 8rem);
  }
</style> -->
