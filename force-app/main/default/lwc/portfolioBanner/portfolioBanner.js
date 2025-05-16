import { LightningElement } from 'lwc';
import PortfolioAssets from '@salesforce/resourceUrl/PortfolioAssets'
import swaranPic from '@salesforce/resourceUrl/swaranPic'
import BackgroundCertificates from '@salesforce/resourceUrl/BackgroundCertificates'
import TransparentImage from '@salesforce/resourceUrl/TransparentImage'
import LinkedInImage from '@salesforce/resourceUrl/LinkedInImage'
import LinkedInIcon from '@salesforce/resourceUrl/LinkedInIcon'
import TrailheadIcon from '@salesforce/resourceUrl/TrailheadIcon'


export default class PortfolioBanner extends LightningElement {
    linkedinUrl = 'https://www.linkedin.com/in/swarandeep-singh-006a4b23/'

    trailheadUrl = 'https://www.salesforce.com/trailblazer/ssdswaran7'
    
    LinkedInIcon =LinkedInIcon
    TrailheadIcon =TrailheadIcon

    userPic = swaranPic
    backgroundImage = BackgroundCertificates
    //backgroundImage=TransparentImage
    
}