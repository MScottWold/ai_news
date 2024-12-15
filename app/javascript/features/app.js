import React from "react";
import { Outlet } from "react-router-dom";
import { useSelector } from "react-redux";
import Footer from "./navigation/footer";
import Masthead from "./navigation/masthead";
import TrendingArticles from "./articles/trending_articles";
import Modal from "./modal/modal";

const App = () => {
  const modalType = useSelector((state) => state.ui.modal);
  const showModal = !!modalType;

  return (
    <div id="app">
      <Masthead />
      <main>
        <Outlet />
        <TrendingArticles />
      </main>
      <Footer />
      {showModal && <Modal modalType={modalType}/>}
    </div>
  );
};

export default App;
