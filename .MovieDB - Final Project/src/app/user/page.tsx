"use client";

import Queries from "@/components/Queries";
import React from "react";
import Image from "next/image";
import Presets from "@/components/Presets";
import InputField from "@/components/InputField";
import QueriesCustom from "@/components/QueriesCustom";
import { useRouter } from "next/navigation";

const User = () => {
  const router = useRouter();

  const logoutButton = (e: React.FormEvent<HTMLElement>) => {
    e.preventDefault();
    router.push("/login/");
  };

  return (
    <div className="font-mono text-green-500 text-center">
      <div className="text-[65px] p-2 flex flex-row border border-white items-center">
        <div className="p-5">
          <Image src="/logoFinal.png" alt="logo" width={100} height={100} />
        </div>
        <h1>MovieDB | CPS510 Term Project | User Menu</h1>
        <div className="p-5">
          <Image src="/userLogo.png" alt="logo" width={100} height={100} />
        </div>
      </div>
      <div className="flex flex-row border-4 border-black p-10 gap-11">
        <div className="text-[35px] flex flex-col gap-3 p-2 justify-start">
          <QueriesCustom></QueriesCustom>
          <div className="">
            <button
              className="mt-11 w-[307px] border border-white hover:bg-green-500 hover:text-white"
              onClick={logoutButton}
            >
              Logout
            </button>
          </div>
        </div>
        <div className="text-[40px] w-full h-[600px] overflow-y-scroll border border-white p-3">
          <div className="border border-white flex flex-row 2xl:gap-11 gap-1 p-2">
            <div className="px-[5px]">
              <Queries></Queries>
            </div>
            <Presets></Presets>
          </div>
          <div className="w-full flex flex-row relative p-3">
            <InputField></InputField>
          </div>
          <div className="border border-white flex flex-row 2xl:gap-11 gap-1 p-2">
            Output
          </div>
          <p id="output" className="text-[30px]">
            Click on a preset or type your own custom query to see the output
            here!
          </p>
        </div>
      </div>
      <div>Developed by Deep Patel and Anmol Panchal, November 2023</div>
    </div>
  );
};

export default User;
