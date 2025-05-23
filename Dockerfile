FROM public.ecr.aws/lambda/python:3.11

COPY app/ ${LAMBDA_TASK_ROOT}/app/
COPY requirements.txt  .

RUN pip install --no-cache-dir -r requirements.txt

COPY app/main.py ${LAMBDA_TASK_ROOT}/main.py

CMD ["main.handler"]