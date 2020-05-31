import React from "react";
import { gql, useQuery } from "@apollo/client";
import SearchResultItem from "./SearchResultItem";

const SEARCH_FURNITURE_QUERY = gql`
  query SearchFurniture($query: String!) {
    furniture(query: $query) {
      nodes {
        name
        variants {
          nodes {
            imageUrl
          }
        }
      }
    }
  }
`;

function SearchResults({ searchTerm }: { searchTerm: string }) {
  const { loading, error, data } = useQuery(SEARCH_FURNITURE_QUERY, {
    variables: { query: searchTerm },
  });

  if (loading) return <div>Loading...</div>;

  const cards = data.furniture.nodes.map((item) => {
    return <SearchResultItem data={item} />;
  });

  return (
    <div className="row row-cols-2 row-cols-md-3 row-cols-lg-6 p-4">
      {cards}
    </div>
  );
}

export default SearchResults;
