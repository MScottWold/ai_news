import React from "react";
import {
  createHashRouter,
  RouterProvider,
} from "react-router-dom"
import App from "./app";
import Combined from "./front_page/combined";
import Article from "./articles/article";
import Author from "./authors/author";
import ProtectedRoute from "../util/route_util";
import { ArchivesCollection, BusinessCollection, FavoritesCollection, PoliticsCollection, SportsCollection, UsCollection } from "./articles/collection";

const router = createHashRouter([
  {
    path: "/",
    element: <App />,
    children: [
      {
        index: true,
        element: <Combined />,
      },
      {
        path: "/articles/:articleId",
        element: <Article />,
      },
      {
        path: "/us",
        element: <UsCollection />,
      },
      {
        path: "/politics",
        element: <PoliticsCollection />,
      },
      {
        path: "/business",
        element: <BusinessCollection />,
      },
      {
        path: "/sports",
        element: <SportsCollection />,
      },
      {
        path: "/archives",
        element: <ArchivesCollection />,
      },
      {
        path: "/favorites",
        element: <ProtectedRoute protected={FavoritesCollection} />,
      },
      {
        path: "/authors/:authorId",
        element: <Author />,
      },
    ],
  },
]);

const Router = () => <RouterProvider router={router} />;

export default Router;
