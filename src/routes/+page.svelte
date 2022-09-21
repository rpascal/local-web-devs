<script>
	import IntroSection from '../components/IntroSection.svelte';
	import WhyUsSection from '../components/WhyUsSection.svelte';
	import ServicesSection from '../components/ServicesSection.svelte';
	import ContactSection from '../components/ContactSection.svelte';
	import Footer from '../components/Footer.svelte';
</script>

<svelte:head>
	<title>Local Web Devs</title>
	<meta name="description" content="100% Handcoded Small Business Website Development and Design starting at $150/mo." />

	<meta property="og:title" content="Local Web Devs"/>
    <meta property="og:description" content="100% Handcoded Small Business Website Development and Design starting at $150/mo."/>
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://www.localwebdevs.com/"/>
    <meta property="og:image" content="https://www.localwebdevs.com/meta/og.png"/>
    <meta property="og:image:secure_url" content="https://www.localwebdevs.com/meta/og.png"/>


</svelte:head>

<IntroSection />
<WhyUsSection />
<ServicesSection />
<ContactSection />
<Footer />

<style>
</style>
