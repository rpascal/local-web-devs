export const variables = {
    contactFormBasePath: import.meta.env.VITE_CONTACT_FORM_BASE_PATH as string,
    contactFormPostUrl: `${import.meta.env.VITE_CONTACT_FORM_BASE_PATH as string}/contact`,
    contactEmail: 'contact@localwebdevs.com',
    mailToContactEmail: 'mailto:contact@localwebdevs.com',
};