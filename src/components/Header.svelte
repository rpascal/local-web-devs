<script lang="ts">
	let scrollYAmount: number = 0;
	// let fixedNavBar: boolean = scrollYAmount > 10
</script>

<svelte:window bind:scrollY={scrollYAmount} />

<nav id="main-navbar" class={scrollYAmount > 10 ? 'header-fixed' : ''}>
	<div class="navbar {scrollYAmount > 10 ? 'bg-primary-focus' : ''}" >
		<div class="flex-1">
			<a class="normal-case {scrollYAmount > 10 ? 'text-xl ml-4' : 'text-3xl m-4'}   " href="/">
				<h1 class="font-bold">Local Web</h1>
				<h1 class="font-light">Devs</h1>
			</a>
		</div>

		<div class="flex justify-end flex-1 px-2 md:hidden">
			<div class="flex items-stretch">
				<div class="dropdown dropdown-end">
					<label tabindex="0" class="btn btn-ghost btn-circle">
						<svg
							xmlns="http://www.w3.org/2000/svg"
							class="h-5 w-5"
							fill="none"
							viewBox="0 0 24 24"
							stroke="currentColor"
							><path
								stroke-linecap="round"
								stroke-linejoin="round"
								stroke-width="2"
								d="M4 6h16M4 12h16M4 18h7"
							/></svg
						>
					</label>
					<ul
						tabindex="0"
						class="menu dropdown-content p-2 shadow bg-base-100 rounded-box w-52 mt-4"
					>
						<li><a href="/#section-intro">Home</a></li>
						<li><a href="/#section-why-us">Why Us</a></li>
						<li><a href="/#section-services">Services</a></li>
						<li><a href="/#section-contact">Contact</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="navbar-end hidden md:flex">
			<ul class="menu menu-horizontal p-0 mr-4 text-xl">
				<li><a href="/#section-intro">Home</a></li>
				<li><a href="/#section-why-us">Why Us</a></li>
				<li><a href="/#section-services">Services</a></li>
				<li><a href="/#section-contact">Contact</a></li>
			</ul>
		</div>
	</div>
</nav>

<style>
	#main-navbar {
		position: absolute;
		/* fixed to stick */
		width: 100%;
		
		top: 0;
		left: 0;
		right: 0;
		transition: padding 0.3s linear;
		-webkit-transition: padding 0.3s linear;
		z-index: 999;
	}

	.header-fixed {
		position: fixed !important;
		left: 0;
		right: 0;
		top: 0;
		background: #fff;
		padding: 0 !important;
		box-shadow: 0 0 4px rgba(0, 0, 0, 0.14), 0 4px 8px rgba(0, 0, 0, 0.28);
		animation: 0.6s slideDown forwards;

	}

</style>
