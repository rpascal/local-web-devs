<script lang="ts">
	import { variables } from '$lib/variables';

	import { SvelteToast,toast } from '@zerodevx/svelte-toast';

	import { reporter,ValidationMessage } from '@felte/reporter-svelte';
	import { createForm } from 'felte';

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
				const res: Response = await fetch("/api/contact", {
					method: 'POST',
					body: JSON.stringify({
						replyToAddresses: [values.email],
						toAddresses: [variables.contactEmail],
						ccAddresses: [],
						bccAddresses: [],
						subject: `[Contact Request] Test Contact Form From App - ${values.name}`,
						body: values.message,
						attachments: []
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
				<span class="label-text">Message</span>
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

		<div class="card-actions justify-end">
			<button type="submit" disabled={!$isValid} class="btn btn-secondary">Send</button>
		</div>
	</div>
</form>

<SvelteToast />

<style>
	:root {
		--toastContainerTop: auto;
		--toastContainerRight: auto;
		--toastContainerBottom: 8rem;
		--toastContainerLeft: calc(50vw - 8rem);
	}
</style>
