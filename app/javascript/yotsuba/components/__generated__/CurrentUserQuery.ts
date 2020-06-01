/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL query operation: CurrentUserQuery
// ====================================================

export interface CurrentUserQuery_currentUser {
  __typename: "User";
  /**
   * The user's username
   */
  username: string;
}

export interface CurrentUserQuery {
  /**
   * The currently authenticated user
   */
  currentUser: CurrentUserQuery_currentUser | null;
}
