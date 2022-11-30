import axios from 'axios'
// import config from '../config.json'

const apiRequest = axios.create({
    baseURL: 'http://ec2-1617047693.us-east-2.elb.amazonaws.com/api'
})

//HealthCheck

let healthCheck = {
    healthcheck: () => {
        return apiRequest.get('/healthcheck');
    },
}

export default healthCheck
