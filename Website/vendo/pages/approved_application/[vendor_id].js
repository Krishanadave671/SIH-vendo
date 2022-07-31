
function VendorApplicationDetails({VendorId}){
    return (
        <div>
            {VendorId}
            <div>{"ascbhbcxjgeq -> in sjehsa"}</div>
        </div>
    );
}

export default VendorApplicationDetails

export async function getServerSideProps(context){
    const {params} = context;
    const {vendor_id} = params;
    return {
        props: { 
            VendorId: vendor_id,
        } 
    }
}