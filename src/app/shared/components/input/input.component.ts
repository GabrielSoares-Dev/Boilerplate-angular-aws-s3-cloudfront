import { Component, Input, Output, EventEmitter } from '@angular/core';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'app-input',
  templateUrl: './input.component.html',
  styleUrl: './input.component.css',
  providers: [],
})
export class InputComponent {
  @Input() id = '';
  @Input() placeholder = '';
  @Input() mode = 'text';
  @Input() label = '';
  @Input() readOnly = false;
  @Input() disabled = false;
  @Input() hasError = false;
  @Input() errorMessage = '';
  @Input() mask = '';
  @Input() control = new FormControl();

  @Output() changeEvent = new EventEmitter();
  @Output() keyupEvent = new EventEmitter();
  @Output() keydownEvent = new EventEmitter();
  @Output() inputEvent = new EventEmitter();

  onChange() {
    this.changeEvent.emit();
  }

  onKeyup() {
    this.keyupEvent.emit();
  }

  onKeydown() {
    this.keydownEvent.emit();
  }

  onInput() {
    this.inputEvent.emit();
  }
}
