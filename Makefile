########################
#       TARGET          #
#########################

TARGET= krigingestimate.a

SUF90=f90
SUF77=f
.SUFFIXES: .f90 .f .o

GSL_prefix = /usr/local
#########################
#      COMPILATION      #
#########################

FAD	= mpif90
F90	= mpif90
F77	= mpif77

#FFLAGS  = -mp -convert big_endian -fpconstant -zero -c
FFLAGS  =  -g -fbacktrace -O3 -fopenmp  -ffree-line-length-10000 #-fbounds-check -fdefault-integer-8

#-r8 -O4 -openmp 

LIBS    = 

SRCS =  dimKrig.o Timer.o main.o functions.o threebarcost.o\
        latin.o mpi.o rbf_interp_nd.o\
        read_set.o Dutch.o Dutchgeninterp.o\
        read_sample.o check_sample.o \
        make_krig.o reduce_data.o tool.o eva_sample.o \
	matrixR.o petitR.o \
        search_krig.o meta.o diff.o output_des.o \
        correct.o LUroutines.o\
        higher.o variance.o\
        indirect.o trust.o trustool.o \
        rank.o vrange.o \
        update.o DynamicPointSelection.o\
        ludim.o lusol2.o \
        bfgs.o bfgs_routines.o eva_bfgs.o \
        dimGA.o ga.o gatool.o \
        post.o monaco.o make_sample.o \
	hammersley.o sobol.o faure.o nieder.o \
	halton.o scf.o \
        scf_df.o scf_df_df.o scf_df_df_db.o \
        scf_db.o scf_db_db.o scf_db_db_df.o \
	scf_db_df.o scf_df_db.o scf_df_df_db_db.o 
OBJS =  ${SRCS:.$(SUF)=.o}

all:  $(TARGET)

$(TARGET): $(OBJS) 
	   ar rvs $@ $(OBJS)
	@echo " ----------- ${TARGET} created ----------- "
.$(SUF90).o:
	$(F90) $(FFLAGS) -c $<
.$(SUF77).o:
	$(F77) $(FFLAGS) -c $<

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clean:
	rm -f $(OBJS) *.L *.msg *.???~ *~
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

