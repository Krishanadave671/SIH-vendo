import React from "react";
import DashboardSidebar from "./components/DashboardSidebar";
import Navbar2 from "./components/Navbar2.jsx";
import Rating from "@mui/material/Rating";
import Card from "react-bootstrap/Card";

export default function dashboard() {
  const customer_review = [
    {
      rating: "2.5",
      custom_officer_date: "16/04/2023",
      custom_officer_title:
        "Quality not upto expectation, bad quality of water used",
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis felis non ante mattis tempus rutrum vel massa. Suspendisse efficitur, augue sit amet vestibulum lobortis, urna mi finibus lectus, vel luctus nunc risus eu turpis. Curabitur eget est eget nisi scelerisque pellentesque. Fusce faucibus sapien vel mauris commodo aliquet. In id dapibus erat. Ut fringilla, nulla et imperdiet aliquet, orci erat fringilla est, quis fermentum mauris lorem ut odio. Quisque est enim, eleifend vel erat vel, lobortis tristique dolor. In molestie massa quam, sed laoreet odio congue eu. Integer a dui dapibus, accumsan nulla in, dictum mi. Ut viverra, dui vel dignissim vehicula, nulla quam rutrum neque, nec rutrum sem mauris nec dui. In tempus lobortis urna quis auctor. Morbi gravida maximus nisi eget fermentum. Praesent pulvinar, velit eget mattis auctor, nunc dui elementum augue, ut hendrerit dui nisl non diam.",
    },
    {
      rating: "4.5",
      custom_officer_date: "16/05/2023",
      custom_officer_title: "All standards passed 👍",
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis felis non ante mattis tempus rutrum vel massa. Suspendisse efficitur, augue sit amet vestibulum lobortis, urna mi finibus lectus, vel luctus nunc risus eu turpis. Curabitur eget est eget nisi scelerisque pellentesque. Fusce faucibus sapien vel mauris commodo aliquet. In id dapibus erat. Ut fringilla, nulla et imperdiet aliquet, orci erat fringilla est, quis fermentum mauris lorem ut odio. Quisque est enim, eleifend vel erat vel, lobortis tristique dolor. In molestie massa quam, sed laoreet odio congue eu. Integer a dui dapibus, accumsan nulla in, dictum mi. Ut viverra, dui vel dignissim vehicula, nulla quam rutrum neque, nec rutrum sem mauris nec dui. In tempus lobortis urna quis auctor. Morbi gravida maximus nisi eget fermentum. Praesent pulvinar, velit eget mattis auctor, nunc dui elementum augue, ut hendrerit dui nisl non diam.",
    },
    {
      rating: "1",
      custom_officer_date: "16/06/2023",
      custom_officer_title: "Cannot provide documents for verification",
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis felis non ante mattis tempus rutrum vel massa. Suspendisse efficitur, augue sit amet vestibulum lobortis, urna mi finibus lectus, vel luctus nunc risus eu turpis. Curabitur eget est eget nisi scelerisque pellentesque. Fusce faucibus sapien vel mauris commodo aliquet. In id dapibus erat. Ut fringilla, nulla et imperdiet aliquet, orci erat fringilla est, quis fermentum mauris lorem ut odio. Quisque est enim, eleifend vel erat vel, lobortis tristique dolor. In molestie massa quam, sed laoreet odio congue eu. Integer a dui dapibus, accumsan nulla in, dictum mi. Ut viverra, dui vel dignissim vehicula, nulla quam rutrum neque, nec rutrum sem mauris nec dui. In tempus lobortis urna quis auctor. Morbi gravida maximus nisi eget fermentum. Praesent pulvinar, velit eget mattis auctor, nunc dui elementum augue, ut hendrerit dui nisl non diam.",
    },
  ];

  const CustomerReview = () => {
    const reviews = customer_review.map((reviews) => {
      return (
        <li>
          <Card>
            <Card.Body>
              <Card.Title>
                <div className="pending-application-section-title">
                  <a href="/approved_application/V1243234">#V1243234</a>
                </div>
                <div className="pending-application-section-title">
                  Kirti College ka vada pav
                </div>
              </Card.Title>
              <Card.Subtitle className="mb-2 text-muted">
                <Rating
                  name="read-only"
                  precision={0.5}
                  value={parseInt(reviews.rating)}
                  readOnly
                />
                <div className="pending-application-section-desc">
                  {" "}
                  {reviews.custom_officer_title}{" "}
                </div>
                <div>{reviews.custom_officer_date}</div>
              </Card.Subtitle>
              <Card.Text>{reviews.desc}</Card.Text>
              <Card.Link href={``}>Card Link</Card.Link>
              <Card.Link href="#">Another Link</Card.Link>
            </Card.Body>
          </Card>
        </li>
      );
    });
    return reviews;
  };
  return (
    <div>
      <DashboardSidebar
        pageWrapId={"page-wrap"}
        outerContainerId={"outer-container"}
      />
      <div className="dashboard-main-container">
        <div
          className="approved-application-main-container"
          style={{ height: "100vh" }}
        >
          <div className="pending-application-section-title">Ratings</div>
          <Rating name="read-only" value={3} readOnly />
          <ul>
            <CustomerReview />
          </ul>
        </div>
      </div>
    </div>
  );
}
