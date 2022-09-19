import { variables } from '$lib/variables';
export const prerender = true

/** @type {import('./$types').Action} */
export async function POST({ request }: any) {
  const r: Request = request
  const bodyJson = await r.json()

  const res: Response = await fetch(variables.contactFormPostUrl, {
    method: 'POST',
    body: JSON.stringify(bodyJson)
  });

  return res;
}