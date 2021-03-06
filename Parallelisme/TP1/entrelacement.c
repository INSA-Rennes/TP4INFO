/* TP1 - Question 1 avec entrelacement */
/* Damien Crémilleux - Lauriane Holy */

#include <pthread.h>
#include <stdio.h>

int cpt;

/* function to be executed by the new data */
void* do_loop(void * data)
{
    int i;
    int me = *((int*) data); 	/* thread number */
    i = 0;
    while(i<10)
    {
	if(((cpt%2 == 0) && (me == 1)) || ((cpt%2 == 1) && (me == 2)))
	{
	    printf("%d - step %d\n", me ,i);
	    i++;
	    cpt++;
	}
	else 
	{
	    pthread_yield();
	}
    }
  
    /* terminate the thread */
    pthread_exit(NULL);
}

int main(int argc, char* argv[])
{
    int thr_id;			/* thread id */
    pthread_t p_thread;		/* thread's structure */
    int a = 1;			/* thread 1 identifying */
    int b = 2;			/* thread 2 identifying */
    pthread_attr_t attr;	/* thread attributes */

    cpt = 0;  
    pthread_attr_init(&attr); 
    thr_id = pthread_create(&p_thread, &attr, do_loop, (void*)&a);
  
    /* run 'do_loop()' in the main thread as well */
    do_loop((void*) &b);
  
    return 0;
}
