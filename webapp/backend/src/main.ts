import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';


async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors({
    origin: 'https://urban-couscous-j6gx7rg6rqqcq7w9-5173.app.github.dev',
    credentials: true,
  });
  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();
