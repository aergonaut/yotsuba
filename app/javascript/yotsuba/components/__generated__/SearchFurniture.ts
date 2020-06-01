/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL query operation: SearchFurniture
// ====================================================

export interface SearchFurniture_furnitures_nodes_variants_nodes {
  __typename: "Variant";
  id: string;
  imageUrl: string | null;
}

export interface SearchFurniture_furnitures_nodes_variants {
  __typename: "VariantConnection";
  /**
   * A list of nodes.
   */
  nodes: (SearchFurniture_furnitures_nodes_variants_nodes | null)[] | null;
}

export interface SearchFurniture_furnitures_nodes {
  __typename: "Fence" | "Floor" | "Houseware" | "Komono" | "Rug" | "WallMounted" | "Wallpaper";
  id: string;
  /**
   * The item's name
   */
  name: string;
  /**
   * The URL slug for this time
   */
  slug: string;
  /**
   * This item's variants
   */
  variants: SearchFurniture_furnitures_nodes_variants;
}

export interface SearchFurniture_furnitures {
  __typename: "FurnitureConnection";
  /**
   * A list of nodes.
   */
  nodes: (SearchFurniture_furnitures_nodes | null)[] | null;
}

export interface SearchFurniture {
  /**
   * List furniture items
   */
  furnitures: SearchFurniture_furnitures;
}

export interface SearchFurnitureVariables {
  query: string;
}
