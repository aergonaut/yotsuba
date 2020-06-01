import React from "react";
import { gql, useQuery } from "@apollo/client";
import SearchResultItem from "./SearchResultItem";
import { RouteComponentProps, useLocation } from "@reach/router";
import queryString from "query-string";
import {
  SearchFurniture,
  SearchFurnitureVariables,
} from "./__generated__/SearchFurniture";

const SEARCH_FURNITURE_QUERY = gql`
  query SearchFurniture($query: String!) {
    furnitures(query: $query) {
      nodes {
        id
        name
        variants {
          nodes {
            id
            imageUrl
          }
        }
      }
    }
  }
`;

function SearchResults({
  searchTerm,
}: { searchTerm: string } & RouteComponentProps) {
  const location = useLocation();
  const params = queryString.parse(location.search);

  const { loading, error, data } = useQuery<
    SearchFurniture,
    SearchFurnitureVariables
  >(SEARCH_FURNITURE_QUERY, {
    variables: { query: params.q as string },
  });

  if (loading) return <div>Loading...</div>;

  const cards = data.furnitures.nodes.map((item) => {
    return <SearchResultItem key={item.id} data={item} />;
  });

  return (
    <div className="container-lg">
      <div className="row row-cols-2 row-cols-md-3 row-cols-lg-6 p-4">
        {cards}
      </div>
    </div>
  );
}

export default SearchResults;
