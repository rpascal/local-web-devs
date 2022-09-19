<script lang="ts">
	import ContactEmailAndPhoneVertical from './contact/ContactEmailAndPhoneVertical.svelte';
	import ContactForm from './contact/ContactForm.svelte';
</script>

<section id="contact" class="pt-20">
	<div class="container my-0 mx-auto px-4 max-w-6xl">
		<div class="mx-auto px-4 max-w-6xl text-center items-center mb-10">
			<p class="text-6xl text-primary font-light">Contact</p>
		</div>

		<div class="grid md:grid-cols-3">
			<div class=" md:hidden">
				<ContactEmailAndPhoneVertical />
			</div>

			<div class="card md:col-span-2 w-full m-auto shadow-xl">
				<ContactForm />
			</div>

			<div class="hidden md:block">
				<ContactEmailAndPhoneVertical />
			</div>
		</div>
	</div>
</section>
