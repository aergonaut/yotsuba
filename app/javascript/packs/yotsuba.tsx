import React from "react";
import ReactDOM from "react-dom";
import App from "yotsuba/App";

const Hello = ({ name }: { name: string }) => <div>Hello {name}!!!</div>;

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<App />, document.getElementById("main_container"));
});
