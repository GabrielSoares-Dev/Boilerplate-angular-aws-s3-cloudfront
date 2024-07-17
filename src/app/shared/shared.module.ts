import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ButtonComponent } from '@shared/components/button/button.component';
import { InputComponent } from '@shared/components/input/input.component';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { NgIconsModule } from '@ng-icons/core';
import { cssSpinner } from '@ng-icons/css.gg';

import { ToastService } from '@services/toast/toast.service';
import { ThemeService } from '@services/theme/theme.service';
import { CookieService } from '@services/cookie/cookie.service';
import { TranslateService } from '@services/translate/translate.service';
import { UserService } from '@services/user/user.service';
import { RouterLink } from '@angular/router';
import { NgxMaskDirective, NgxMaskPipe, provideNgxMask } from 'ngx-mask';

import {
  ToastrModule as ToastLibModule,
  ToastrService as ToastLibService,
} from 'ngx-toastr';
import { CookieService as CookieLibService } from 'ngx-cookie-service';
import {
  TranslateModule,
  TranslateService as TranslateLibService,
  TranslateLoader,
} from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { HttpClient } from '@angular/common/http';

@NgModule({
  declarations: [ButtonComponent, InputComponent],
  imports: [
    NgxMaskDirective,
    NgxMaskPipe,
    RouterLink,
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    NgIconsModule.withIcons({ cssSpinner }),
    ToastLibModule.forRoot({ autoDismiss: true, maxOpened: 1 }),
    TranslateModule.forRoot({
      defaultLanguage: 'pt',
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient],
      },
    }),
  ],
  exports: [
    ButtonComponent,
    InputComponent,
    FormsModule,
    ReactiveFormsModule,
    TranslateModule,
    CommonModule,
    RouterLink,
  ],
  providers: [
    ToastLibService,
    CookieLibService,
    TranslateLibService,

    ToastService,
    ThemeService,
    CookieService,
    TranslateService,
    UserService,
    provideNgxMask(),
  ],
})
export class SharedModule {}

export function HttpLoaderFactory(http: HttpClient): TranslateHttpLoader {
  return new TranslateHttpLoader(http, '../../assets/i18n/', '.json');
}
