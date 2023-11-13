import React from 'react'

const DropViews = () => {

  const handler = async () => { 
    let request = await fetch('/app/api/DropViews.js')
    const data = await request.json()
    console.log(data);
  }

  return (
    <button className='border border-white hover:bg-green-500 hover:text-white'>DropViews</button>
  )
}

export default DropViews