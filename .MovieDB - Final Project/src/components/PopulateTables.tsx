import React from 'react'

const PopulateTables = () => {

  const handler = async () => { 
    let request = await fetch('/app/api/PopulateTables.js')
    const data = await request.json()
    console.log(data);
  }

  return (
    <button className='border border-white hover:bg-green-500 hover:text-white'>PopulateTables</button>
  )
}

export default PopulateTables