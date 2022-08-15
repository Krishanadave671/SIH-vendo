import Navbar from "../components/Navbar2";

export default function Bazaar({BazaarID}){

    return(
        <div>
            Bazaar1
        </div>
    );
}


export async function getServerSideProps(context) {
    const { params } = context;
    const { bazaar_id } = params;
    return {
      props: {
        BazaarID: bazaar_id,
      },
    };
  }