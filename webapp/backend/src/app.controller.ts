import { Controller, Get } from '@nestjs/common';


@Controller()
export class AppController {
  @Get('api/summary')
  getSummary(): any {
    return {
      title: 'This is a test summary',
      summary: 'We’re just checking if everything works!',
    };
  }
}