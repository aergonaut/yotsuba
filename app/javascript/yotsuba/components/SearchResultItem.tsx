import React from "react";

function SearchResultItem({ data }) {
  return (
    <div className="col mb-4">
      <div className="card h-100">
        <img
          src={data.variants.nodes[0].imageUrl}
          alt={data.name}
          title={data.name}
          className="card-image-top"
          style={{ objectFit: "contain" }}
        />
        <div className="card-body">
          <h6 className="card-title" style={{ textTransform: "capitalize" }}>
            {data.name}
          </h6>
        </div>
      </div>
    </div>
  );
}

export default SearchResultItem;
