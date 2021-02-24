import React from 'react';

class LatestArticleItem extends React.Component {
  constructor(props) {
    super(props);
  }
  
  render() {
    const { photo, section, title, id} = this.props;

    return (
      <div className="latest-art">
        <img className="small-photo" src={photo.photoUrl} alt={photo.altText} />
        <ul>
          <li className={`${section}-tag`}>{section}</li>
          <li><a className="list-headline" href={`#/articles/${id}`}>{title}</a></li>
          {/* <li><p>{article.createAt}</p></li> */}
        </ul>
      </div>
    );
  }
};

export default LatestArticleItem;