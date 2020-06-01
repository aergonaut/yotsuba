/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL query operation: ItemDetailQuery
// ====================================================

export interface ItemDetailQuery_furniture_variants_nodes {
  __typename: "Variant";
  imageUrl: string | null;
}

export interface ItemDetailQuery_furniture_variants {
  __typename: "VariantConnection";
  /**
   * A list of nodes.
   */
  nodes: (ItemDetailQuery_furniture_variants_nodes | null)[] | null;
}

export interface ItemDetailQuery_furniture {
  __typename: "Fence" | "Floor" | "Houseware" | "Komono" | "Rug" | "WallMounted" | "Wallpaper";
  id: string;
  /**
   * The item's name
   */
  name: string;
  /**
   * Extra information about how to obtain this item
   */
  sourceNotes: string | null;
  /**
   * Is this item buyable through the catalog?
   */
  catalog: boolean;
  /**
   * Is this item a DIY?
   */
  diy: boolean;
  /**
   * This item's variants
   */
  variants: ItemDetailQuery_furniture_variants;
}

export interface ItemDetailQuery {
  /**
   * Find a furniture item by slug
   */
  furniture: ItemDetailQuery_furniture | null;
}

export interface ItemDetailQueryVariables {
  slug: string;
}
