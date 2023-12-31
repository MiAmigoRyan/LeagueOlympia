import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { EmailService } from 'src/app/services/email.service';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css']
})
export class ContactComponent {
  formData = {
    name: "",
    email:"",
    message:""
  };
  FormData!: FormGroup;
  constructor(private builder: FormBuilder, private contact: EmailService){}

  ngOnInit(){
    this.FormData = this.builder.group({
      // EmailAddress: new FormControl('', [Validators.compose([Validators.required, Validators.email])]),
      Body: new FormControl('', [Validators.required])
      })
      }


  confirmationMsg(){
    alert("Thank you for your input, your message has been sent.")
    setTimeout(()=>{
      alert('');
    }, 3000);
  }

  onSubmit(FormData: any) {
    this.contact.SendEmail(FormData)
      .subscribe((response: any) => {
        location.href = 'https://mailthis.to/confirm'
      }, (error: { responseText: any; }) => {
      console.warn(error.responseText)
      console.log({ error })
    })
}
}
