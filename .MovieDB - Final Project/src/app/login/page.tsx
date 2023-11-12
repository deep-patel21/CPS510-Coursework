import React from 'react'
import Admin from '../admin/page';
import User from '../user/page'

const Login = () => {


  const admin = true;

  return (
    <div>
        
        {(admin ? <Admin></Admin>:<User></User>)}

    </div>
  )
}

export default Login