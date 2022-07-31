import Button from 'react-bootstrap/Button';
import Accordion from 'react-bootstrap/Accordion';

function VendorApplicationDetails({VendorId}){
    return (
        <div className="pending-application-container">
            <div className='pending-application-container-item'>
                <Button variant="primary" className='pending-application-banner'>Application ID - {VendorId}</Button>{' '}
                <div className="pending-application-section-title">Vendor Name </div>
                <div className="pending-application-section-desc">kirti college ka vada pav </div>
                <div className="pending-application-section-title">Vendor Type </div>
                <div className="pending-application-section-desc">Snacks and fast food </div>
                <Button variant="primary" className='pending-application-banner'>Applicant Details </Button>{' '}
                <div className="pending-application-section-title">Applicant Name </div>
                <div className="pending-application-section-desc"> Ram Singh </div>
                <div className="pending-application-section-title">Applicant Address </div>
                <div className="pending-application-section-desc"> 302, A complex, Satyam bhavan, near kirti college, VS Road, Dadar west, Mumbai - 400028</div>
                <div className="pending-application-section-title">Educational qualification </div>
                <div className="pending-application-section-desc"> BE in Computers, IIT Bombay</div>
                <div className="pending-application-section-title">Documents </div>
                <div className="pending-application-accordion">
                    <Accordion defaultActiveKey="0">
                        <Accordion.Item eventKey="0">
                            <Accordion.Header>Aadhar Card</Accordion.Header>
                            <Accordion.Body>
                            {/* Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
                            eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
                            minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                            aliquip ex ea commodo consequat. Duis aute irure dolor in
                            reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                            pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
                            culpa qui officia deserunt mollit anim id est laborum. */}
                            <image href='https://www.google.com/search?q=image&rlz=1C1CHBF_enIN1014IN1014&sxsrf=ALiCzsYWVvjUEpnXMyphq0wcqc3FKjr9mw:1659288732820&tbm=isch&source=iu&ictx=1&vet=1&fir=L2hxXuK7NBWJmM%252C0JWe7yDOKrVFAM%252C_%253BDH7p1w2o_fIU8M%252CBa_eiczVaD9-zM%252C_%253Bn5hAWsQ-sgKo_M%252C-UStXW0dQEx4SM%252C_%253BI47E5zEVdN-joM%252CZUlRqjbz2TDaIM%252C_%253BqXynBYpZpHkhWM%252C4O2GvGuD-Cf09M%252C_%253BBx81dUgHmqLhzM%252CNMmM-IXyCkU2hM%252C_%253B-VCM1w56w6u5VM%252CaVwfeogQqK1XmM%252C_%253B2nDXavJs9DoKTM%252CB51x0PBR9KNzvM%252C_%253Bz4_uU0QB2pe-SM%252C7SySw5zvOgPYAM%252C_%253BMOAYgJU89sFKnM%252CygIoihldBPn-LM%252C_%253B2DNOEjVi-CBaYM%252CAOz9-XMe1ixZJM%252C_%253BkwgHAQqTiLQXLM%252CR0KnAtfyBDsyiM%252C_%253BQOZymhPf48LDYM%252CibTdn4unYxO9nM%252C_%253BsI3XXpFjQg61vM%252C0_HmqFdutkPVdM%252C_&usg=AI4_-kQwK4qIG6Q6CqPhVxJMf9LjApUGTQ&sa=X&ved=2ahUKEwjbzfmb1KP5AhXkmlYBHVZ_AWwQ9QF6BAgEEAE#imgrc=L2hxXuK7NBWJmM'/>
                            </Accordion.Body>
                        </Accordion.Item>
                        <Accordion.Item eventKey="1">
                            <Accordion.Header>PAN Card</Accordion.Header>
                            <Accordion.Body>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
                            eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
                            minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                            aliquip ex ea commodo consequat. Duis aute irure dolor in
                            reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                            pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
                            culpa qui officia deserunt mollit anim id est laborum.
                            </Accordion.Body>
                        </Accordion.Item>
                    </Accordion>
                </div>
                <div className="pending-application-btn">
                    <Button variant="primary">Approve</Button>{' '}
                    <Button variant="primary">Reject</Button>{' '}
                </div>
            </div>
            <div className='pending-application-container-item'>
                <div className="pending-application-section-title">Vendor Location </div>
                <div className="pending-application-section-desc">Govardhan complex, Jogeshwari East</div>
                <iframe 
                src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3769.272443884724!2d72.8550272!3d19.139548!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7b7d211a8f3f9%3A0xc486c8427dd019a8!2sGovardhan%20Complex%2C%20Jogeshwari%20East%2C%20Mumbai%2C%20Maharashtra%20400060!5e0!3m2!1sen!2sin!4v1659283732518!5m2!1sen!2sin" 
                title="description"
                height={400}></iframe>
            </div>
        </div>
    );
}

export default VendorApplicationDetails

export async function getServerSideProps(context){
    const {params} = context;
    const {application_id} = params;
    return {
        props: { 
            VendorId: application_id,
        } 
    }
}