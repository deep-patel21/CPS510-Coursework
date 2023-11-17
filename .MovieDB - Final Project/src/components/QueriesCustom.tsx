'use client';

import React from 'react'

const QueriesCustom = () => {
    const handlerCustom = async () => { 
        let querycontent = document.getElementById("input") as HTMLInputElement;
        let outputcontent = document.getElementById("output");
        let userQuery = querycontent["value"];
        try {
            const response = await fetch(`http://localhost:3001/api/QueryCustom?userQueryInput=${userQuery}`, { method: 'GET' });
            const data = await response.json();
            const table = document.createElement("table");
            table.style.marginTop = '8px';
            table.style.borderCollapse = 'collapse';
            table.style.width = '100%';
            table.style.border = '1px solid #a0aec0';
            const header = document.createElement("tr");
            if (outputcontent && querycontent) {
            querycontent.setAttribute( 
                "value",
                "reza is the goaty"
            );
            for(const row of data) {
                const tr = document.createElement("tr");
                for(const cellValue of row) {
                const td = document.createElement("td");
                td.textContent = cellValue;
                td.style.border = '1px solid #334155';
                td.style.padding = '8px';
                td.style.textAlign = 'center';
                tr.appendChild(td);
                }
                table.appendChild(tr);
            }
            outputcontent.innerHTML = '';
            outputcontent.appendChild(table);
            }
            console.log(data);
            //alert("Successfully queried data!");
        } catch (error) {
            let outputcontent = document.getElementById("output");
            if (outputcontent) {
                outputcontent.textContent = "ERROR! Please ensure you have created and populated the tables before attempting to query data.";        }
            console.error(error);
        }
    }

  return (
    <div>
        <button className="mt-10 w-full border border-white hover:bg-green-500 hover:text-white"
        onClick={handlerCustom}>
        Execute Custom Query
        </button>
    </div>
  )
}

export default QueriesCustom