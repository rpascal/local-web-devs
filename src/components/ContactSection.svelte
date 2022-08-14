<script lang="ts">
	import ContactEmailAndPhoneVertical from './contact/ContactEmailAndPhoneVertical.svelte';

	import { variables } from '$lib/variables';

	import { SvelteToast, toast } from '@zerodevx/svelte-toast';

	import { createForm } from 'felte';
	import { reporter, ValidationMessage } from '@felte/reporter-svelte';

	import { validator } from '@felte/validator-zod';
	import { z } from 'zod';

	const schema = z.object({
		name: z.string().min(1),
		email: z.string().email().min(1),
		message: z.string().min(1),
		phone: z.string().min(1) //TODO validite phone number
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
				const res: Response = await fetch(`${variables.contactFormBasePath}/contact`, {
					method: 'POST',
					body: JSON.stringify({
						toAddresses: [values.email],
						ccAddresses: [],
						bccAddresses: [],
						subject: `Test Contact Form From App - ${values.name}`,
						body: values.message
					})
				});

				if (res.ok) {
					reset();
					toast.push('Message Sent');
				} else {
					console.error('Not ok response from contact form: ' + res.status);
					failedToast();
				}
			} catch (e) {
				console.error('Failed to send contact form email', e);
				failedToast();
			}
		},
		extend: [reporter, validator({ schema })]
	});
</script>

<section id="section-contact" class="pt-20">
	<div class="container my-0 mx-auto px-4 max-w-6xl">
		<div class="mx-auto px-4 max-w-6xl text-center items-center mb-10">
			<p class="text-6xl text-primary font-light">Contact</p>
		</div>

		<div class="grid md:grid-cols-3">
			<div class=" md:hidden">
				<ContactEmailAndPhoneVertical />
			</div>

			<div class="card md:col-span-2 w-full m-auto shadow-xl">
				<form use:form>
					<div class="card-body ">
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

						<div class="form-control w-full ">
							<label for="phone-input" class="label">
								<span class="label-text">Phone Number</span>
							</label>
							<input
								id="phone-input"
								type="string"
								name="phone"
								placeholder="Enter Phone Number"
								class="input input-bordered w-full"
							/>

							<ValidationMessage for="phone" let:messages>
								<label class="label" for="phone">
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

						<!-- <div class="pt-2 w-full text-right">
                            <button type="submit" disabled={!$isValid} class="btn btn-secondary">Send</button>
                        </div> -->

						<div class="card-actions justify-end">
							<button type="submit" disabled={!$isValid} class="btn btn-secondary">Send</button>
						</div>
					</div>
				</form>
			</div>

			<div class="hidden md:block">
				<ContactEmailAndPhoneVertical />
			</div>
		</div>
	</div>
</section>

<SvelteToast />

<style>
	:root {
		--toastContainerTop: auto;
		--toastContainerRight: auto;
		--toastContainerBottom: 8rem;
		--toastContainerLeft: calc(50vw - 8rem);
	}
</style>
