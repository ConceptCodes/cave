import Head from 'next/head'
import Image from 'next/image'
import Nav from '../components/Nav'

export default function Home() {
  return (
    <div className="flex flex-col min-h-screen p-5 space-y-10">
      <Head>
        <title>Cave</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <Nav />
      <main className="">
        <section className="flex justify-between p-0 bg-green-200 rounded-xl"> 
          <article className="p-5">
            <h1 className="text-6xl capitalize">Find your best real estate</h1>
            <p>lorem ipsum dolor sit amet, consectetur adipiscing</p>
          </article>
          <div>
            <Image className="rounded-r-2xl w-1/2" src="https://via.placeholder.com/500" width={600} height={450} />
          </div>
        </section>
        <section className="flex justify-between">
          <Image className="rounded-xl w-1/3" src="https://via.placeholder.com/500" width={300} height={500} />
          <article className="flex flex-col"> 
            <ul className="flex justify-between pb-4"> 
              <li className="flex flex-col">
                  <h1 className="text-6xl font-bold">12</h1>
                  <p>years of experience</p>
              </li>
              <li className="flex flex-col">
                  <h1 className="text-6xl font-bold">579</h1>
                  <p>apartments rented in the last year</p>
              </li>
              <li className="flex flex-col">
                  <h1 className="text-6xl font-bold">37</h1>
                  <p>countries we operate in</p>
              </li>
            </ul>
            <Image className="rounded-2xl" src="https://via.placeholder.com/400" width={400} height={400} />
          </article>
        </section>
      </main>
    </div>
  )
}
