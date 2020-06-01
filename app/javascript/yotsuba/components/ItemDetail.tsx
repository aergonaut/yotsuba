import React from "react";
import { RouteComponentProps } from "@reach/router";
import { gql, useQuery } from "@apollo/client";
import {
  ItemDetailQuery,
  ItemDetailQueryVariables,
} from "./__generated__/ItemDetailQuery";
import { CheckSquare, XSquare } from "react-feather";

const ITEM_DETAIL_QUERY = gql`
  query ItemDetailQuery($slug: String!) {
    furniture(slug: $slug) {
      id
      name
      sourceNotes
      catalog
      diy
      variants {
        nodes {
          imageUrl
        }
      }
    }
  }
`;

function ItemDetail({ slug }: { slug?: string } & RouteComponentProps) {
  const { loading, error, data } = useQuery<
    ItemDetailQuery,
    ItemDetailQueryVariables
  >(ITEM_DETAIL_QUERY, { variables: { slug: slug } });

  if (loading) return <div>Loading...</div>;

  return (
    <div className="container-lg">
      <div className="row m-4">
        <div className="col">
          <img
            src={data.furniture.variants.nodes[0].imageUrl}
            className="mx-auto d-block"
          />
        </div>
        <div className="col-9">
          <h1 style={{ textTransform: "capitalize" }}>{data.furniture.name}</h1>
          <p>{data.furniture.sourceNotes}</p>
          <dl>
            <dt>Orderable?</dt>
            <dd>{data.furniture.catalog ? <CheckSquare /> : <XSquare />}</dd>
            <dt>DIY?</dt>
            <dd>{data.furniture.diy ? <CheckSquare /> : <XSquare />}</dd>
          </dl>
        </div>
      </div>
    </div>
  );
}

export default ItemDetail;
