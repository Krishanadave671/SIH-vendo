import React from "react";
import styles from "../../styles/Home.module.css";
import {Line} from "react-chartjs-2";
import {Doughnut} from "react-chartjs-2";
import Chart from 'chart.js/auto';
import {CategoryScale} from 'chart.js'; 
Chart.register(CategoryScale);

const data = {
	labels: [
		"Registered Vendors",
		"Approved Vendors",
		"Rejected Vendors",
		
	],
	datasets: [
		{
			data: [15, 80, 5],
			backgroundColor: ["#7393B3", "#36A2EB", "#FFCE56"],
			hoverBackgroundColor: ["#CCCCFF", "#7393B3", "#191970"],
		},
	],
};

//doughnut chart data set

const data1 = {
	labels: ["Pending", "Verified", "New"],
	datasets: [
		{
			data: [300, 50, 100],
			backgroundColor: ["#FF6384", "#36A2EB", "#FFCE56"],
			hoverBackgroundColor: ["#FF6384", "#36A2EB", "#FFCE56"],
		},
	],
};

function Content() {
    return (<div className="ContentContainer">
      <section className="ScrollText">
        <p>Vendos is an initiative to implement smart city planning and provide multiple benefits to vendors and street hawkers. We hope you find this platform helpful and make the best use of it!</p>
      </section>
      <div className="ContentWrapper">
        <div className="Tabs">
           <div className="Categories">
            <h2>Vendors under me</h2>
           </div>
        </div>

        <div className="Tabs">
           <div className="Categories">
            <h2>Zones under me</h2>
           </div>
        </div>

        <div className="Tabs">
           <div className="Categories">
            <h2>Active Schemes</h2>
           </div>
        </div>

        <div className="Tabs">
           <div className="Categories">
            <h2>Pending Approvals</h2>
           </div>
        </div>
      </div>

      {/* chart js started */}    
      
      
      <div className="charts">
      <div className="circle1">
          <h2></h2>
		      <Doughnut data={data} width={400} height={400}></Doughnut>
        </div>
        <div className="circle">
          <h2></h2>
          <Doughnut data={data1} width={400} height={400}></Doughnut>
        </div>
</div>
       
        
    
    </div> 
    );
}

export default Content;