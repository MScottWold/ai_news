import React from 'react';
import { sectionNames } from '../../util/ui_util';

class ArticleListItem extends React.Component {
  constructor(props) {
    super(props);
  }
  
  render() {
    const { photo, section, title, id} = this.props;

    return (
      <div className="latest-art">
        <img className="small-photo" src={photo.photoUrl} alt={photo.altText} />
        <ul>
          <li className={`${section}-tag`}>{sectionNames[section]}</li>
          <li><a className="list-headline" href={`#/articles/${id}`}>{title}</a></li>
          {/* <li><p>{article.createAt}</p></li> */}
        </ul>
      </div>
    );
  }
};

export default ArticleListItem;