"use client";

import React from "react";

const Presets = () => {
  const handler = async () => {
    let request = await fetch("/app/api/Queries.js");
    const data = await request.json();
    console.log(data);
  };

  const testFunc1 = async () => {
    let content = document.getElementById("output");
    if (content) {
      content.textContent = "Hello. Test Successful for Query Preset 1.";
      content.setAttribute(
        "value",
        "Hello. Test Successful for Query Preset 1.Hello.Test Successful for Query Preset 1."
      );
    }
  };
  const testFunc2 = async () => {
    let content = document.getElementById("output");
    if (content) {
      content.textContent = "Hi. Success for Query Preset 2 Test.";
      content.setAttribute("value", "Hi. Success for Query Preset 2 Test.");
    }
  };
  const testFunc3 = async () => {
    let content = document.getElementById("output");
    if (content) {
      content.setAttribute("value", "Hey. Query Preset 3 is SUCCESS!!!");
    }
  };
  const testFunc4 = async () => {
    let content = document.getElementById("output");
    if (content) {
      content.innerHTML = "Yo. The test has passed for Query Preset 4.";
      content.setAttribute(
        "value",
        "Yo. The test has passed for Query Preset 4."
      );
    }
  };

  return (
    <div className="flex flex-row text-2xl gap-1 2xl:gap-11 2xl:ml-0">
      <button
        className="hover:bg-green-500 hover:text-white"
        onClick={testFunc1}
        >
        {" "}
        | Preset 1 |{" "}
      </button>
      <button
        className="hover:bg-green-500 hover:text-white"
        onClick={testFunc2}
      >
        {" "}
        | Preset 2 |{" "}
      </button>
      <button
        className="hover:bg-green-500 hover:text-white"
        onClick={testFunc3}
      >
        {" "}
        | Preset 3 |{" "}
      </button>
      <button
        className="hover:bg-green-500 hover:text-white"
        onClick={testFunc4}
      >
        {" "}
        | Preset 4 |{" "}
      </button>
    </div>
  );
};

export default Presets;
