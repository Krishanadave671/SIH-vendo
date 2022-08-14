import React from "react";
import styles from "../../styles/Home.module.css";
import {Line} from "react-chartjs-2";
import {Doughnut} from "react-chartjs-2";
import Chart from 'chart.js/auto';
import {CategoryScale} from 'chart.js'; 
Chart.register(CategoryScale);

const data = {
	labels: [
		"January",
		"February",
		"March",
		"April",
		"May",
		"June",
		"July",
		"August",
		"September",
		"October",
		"November",
		"December",
	],
	datasets: [
		{
			label: "Sales/ month",
			fill: true,
			lineTension: 0.1,
			backgroundColor: "rgba(75,192,192,0.4)",
			borderColor: "rgba(75,192,192,1)",
			borderCapStyle: "butt",
			borderDash: [],
			borderDashOffset: 0.0,
			borderJoinStyle: "miter",
			pointBorderColor: "rgba(75,192,192,1)",
			pointBackgroundColor: "#fff",
			pointBorderWidth: 0,
			pointHoverRadius: 0,
			pointHoverBackgroundColor: "rgba(75,192,192,1)",
			pointHoverBorderColor: "rgba(220,220,220,1)",
			pointHoverBorderWidth: 0,
			pointRadius: 0,
			pointHitRadius: 0,
			data: [65, 59, 80, 81, 56, 55, 40, 57, 40, 48, 59, 62],
		},
	],
};

//doughnut chart data set

const data1 = {
	labels: ["Organic", "Social Media", "Websites"],
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
        <div className="bar">
          <h2>sales</h2>
          <Line data={data} width={400} height={400}></Line>
        </div>
        <div className="circle">
          <h2>Customers Arrived</h2>
          <Doughnut data={data1} width={400} height={400}></Doughnut>
        </div>
      </div>
    </div>
    );
}

export default Content;