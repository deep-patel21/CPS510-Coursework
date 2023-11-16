import React from 'react'

const Queries = () => {

  const handler = async () => { 
    let request = await fetch('/app/api/Queries.js')
    const data = await request.json()
    console.log(data);
  }

  return (  
    <div>
      Output
    </div>
  )
}

export default Queries