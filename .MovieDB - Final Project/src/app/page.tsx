import Image from 'next/image'
import Login from './login/page'
import Admin from './admin/page';
import User from './user/page';

export default function Home() {

  const admin = true;

  return (
    <>
      <Login></Login>
    </>
  )
}
