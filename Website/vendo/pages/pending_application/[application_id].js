
function VendorApplicationDetails({VendorId}){
    return (
        <div>
            {VendorId}
            <div>ascbhbcxjgeq</div>
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