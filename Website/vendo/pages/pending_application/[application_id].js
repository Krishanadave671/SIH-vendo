import Button from "react-bootstrap/Button";
import Navbar from "../components/Navbar2";

function VendorApplicationDetails({ VendorId }) {
  return (
    <div>
      <Navbar />
      <div className="pending-application-container">
        <div className="pending-application-container-item">
          <Button variant="primary" className="pending-application-banner">
            Application ID - {VendorId}
          </Button>{" "}
          <div className="pending-application-section-title">Vendor Name </div>
          <div className="pending-application-section-desc">
            kirti college ka vada pav{" "}
          </div>
          <div className="pending-application-section-title">Vendor Type </div>
          <div className="pending-application-section-desc">
            Snacks and fast food{" "}
          </div>
          <Button variant="primary" className="pending-application-banner">
            Applicant Details{" "}
          </Button>{" "}
          <div className="pending-application-section-title">
            Applicant Name{" "}
          </div>
          <div className="pending-application-section-desc"> Ram Singh </div>
          <div className="pending-application-section-title">
            Applicant Address{" "}
          </div>
          <div className="pending-application-section-desc">
            {" "}
            302, A complex, Satyam bhavan, near kirti college, VS Road, Dadar
            west, Mumbai - 400028
          </div>
          <div className="pending-application-section-title">
            Educational qualification{" "}
          </div>
          <div className="pending-application-section-desc">
            {" "}
            BE in Computers, IIT Bombay
          </div>
          <div className="pending-application-section-title">Documents </div>
          <div className="pending-application-docs">
            <a
              href="https://firebasestorage.googleapis.com/v0/b/dhatnoon-backend.appspot.com/o/DBMS_Notes.pdf?alt=media&token=6a001bc9-3a6c-4cd0-8324-460caeab3f15"
              target="_blank"
              rel="noreferrer"
            >
              Download Pdf
            </a>
            <a
              href="https://firebasestorage.googleapis.com/v0/b/dhatnoon-backend.appspot.com/o/DBMS_Notes.pdf?alt=media&token=6a001bc9-3a6c-4cd0-8324-460caeab3f15"
              target="_blank"
              rel="noreferrer"
            >
              View PAN Card
            </a>
          </div>
          <div className="pending-application-btn">
            <Button variant="primary">Approve</Button>{" "}
            <Button variant="primary">Reject</Button>{" "}
          </div>
        </div>
        <div className="pending-application-container-item">
          <div className="pending-application-section-title">
            Vendor Location{" "}
          </div>
          <div className="pending-application-section-desc">
            Govardhan complex, Jogeshwari East
          </div>
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3769.272443884724!2d72.8550272!3d19.139548!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7b7d211a8f3f9%3A0xc486c8427dd019a8!2sGovardhan%20Complex%2C%20Jogeshwari%20East%2C%20Mumbai%2C%20Maharashtra%20400060!5e0!3m2!1sen!2sin!4v1659283732518!5m2!1sen!2sin"
            title="description"
            height={400}
          />
        </div>
      </div>
    </div>
  );
}

export default VendorApplicationDetails;

export async function getServerSideProps(context) {
  const { params } = context;
  const { application_id } = params;
  return {
    props: {
      VendorId: application_id,
    },
  };
}
