<script>
	import { variables } from '$lib/variables';
</script>

<div class="flex mb-5">
	<div class="divider divider-horizontal before:bg-secondary after:bg-secondary" />
	<div>
		<p class="text-3xl font-bold mb-2">Email</p>
		<p>
			<a href={variables.mailToContactEmail} class="text-lg">{variables.contactEmail}</a>
		</p>
	</div>
</div>

<div class="flex ">
	<div class="divider divider-horizontal before:bg-secondary after:bg-secondary" />
	<div>
		<p class="text-3xl font-bold mb-2">Phone</p>

		<p>
			<a href="tel:3304219134" class="text-lg">(330) 421-9134</a>
		</p>
	</div>
</div>
