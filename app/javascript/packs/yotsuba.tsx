import React from "react";
import ReactDOM from "react-dom";

const Hello = ({ name }: { name: string }) => <div>Hello {name}!!!</div>;

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <Hello name="React" />,
    document.body.appendChild(document.createElement("div"))
  );
});
