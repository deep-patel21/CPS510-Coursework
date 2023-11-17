"use client";

import React, { useState } from "react";
import Admin from "../admin/page";
import User from "../user/page";
import Image from "next/image";
import { useRouter } from "next/navigation";

const Login = () => {
  const admin = true;
  const [user, setUser] = useState("");
  const [pass, setPass] = useState("");
  const router = useRouter();

  const userChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setUser(event.target.value);
  };
  const passChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setPass(event.target.value);
  };

  const loginButton = (e:React.FormEvent<HTMLElement>) => {
    e.preventDefault()
    if (user == "admin" && pass == "admin") {
      console.log("run");
      router.push("/admin/");
    } else {
      console.log("run");
      router.push("/user/");
    }
    
  };

  return (
    <div className="flex flex-col justify-center items-center font-mono text-green-500">
      <div className="w-3/4 h-screen p-28 2xl:flex 2xl:flex-col 2xl:justify-center">
        <form className="border-2 border-green-500 w-full h-full flex flex-col gap-12 pt-3 2xl:h-3/5">
          <div className="w-full h-full flex flex-row justify-center items-center">
            <h1 className="text-7xl text-center pt-5 font-mono">Login</h1>
          </div>

          <div className="flex flex-row justify-around">
            <input
              className="bg-black text-white placeholder-white border-2 border-green-500 outline-none p-2 h-1/2 2xl:text-2xl"
              placeholder="Username..."
              onChange={userChange}
            ></input>
            <Image
              src="/logoFinal.png"
              alt=""
              height={100}
              width={100}
              className="m-0"
            />
            <input
              className="bg-black text-white placeholder-white border-2 border-green-500 outline-none p-2 h-1/2 2xl:text-2xl"
              placeholder="Password..."
              onChange={passChange}
              type="password"
            ></input>
          </div>

          <div className="h-full text-center">
            <button
              className="text-white w-1/2 border-2 border-green-500 outline-none p-2 hover:bg-green-500 2xl:text-3xl"
              onClick={loginButton}
            >
              Login
            </button>
          </div>
        </form>
        <div className="w-full text-center p-5">
          Developed by Deep Patel and Anmol Panchal, November 2023
        </div>
      </div>
    </div>
  );
};

export default Login;
