import React from 'react'

const CreateTables = () => {

  const handler = async () =>
  {
    let request = await fetch('/app/api/CreateTables.js')
    const response = await request.json();
    console.log(response);
  } 

  return (
    <button className='border border-white hover:bg-green-500 hover:text-white'>CreateTables</button>
  )
}

export default CreateTables