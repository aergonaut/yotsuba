import React from "react";
import { SearchFurniture_furnitures_nodes } from "./__generated__/SearchFurniture";
import { Link } from "@reach/router";

function SearchResultItem({
  data,
}: {
  data: SearchFurniture_furnitures_nodes;
}) {
  return (
    <div className="col mb-4">
      <div className="card h-100">
        <img
          src={data.variants.nodes[0].imageUrl}
          alt={data.name}
          title={data.name}
          className="card-img-top"
          height={128}
          style={{ objectFit: "contain", width: "auto" }}
        />
        <div className="card-body">
          <h6 className="card-title" style={{ textTransform: "capitalize" }}>
            <Link to={`/items/${data.slug}`} className="card-link">
              {data.name}
            </Link>
          </h6>
          <p className="card-text">
            <small>
              {data.variants.nodes.length > 1
                ? `${data.variants.nodes.length} Variations`
                : null}
            </small>
          </p>
        </div>
      </div>
    </div>
  );
}

export default SearchResultItem;
