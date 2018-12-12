function [ interpolatedField,interpolatedMagnetization ] = interp2size( field,magnetization,newSize )
%Takes any magnetization (or voltage) and field and gives you a new field
%and magentization that are the newSize long NEW SIZE HAS TO BE ODD. 
%It assumes that the feild
%starts low, ascends to the maximum value, and returns to the starting
%field value.
%***This is different from the interp2size in the VSM package because the
%VSM data was formatted differently***
if(mod(newSize,2)~=1)
    ME=MEexception('newSize has to be odd');
    throw(ME);
end
[~,middleindex]=max(field);
step=2*(max(field)-min(field))/newSize;
newDescendingField=max(field):-step:min(field);
newAscendingField=min(field)+step:step:max(field);
newAscendingMagnetization=interp1(field(1:middleindex),magnetization(1:middleindex),newAscendingField,'linear');
newDescendingMagnetization=interp1(field(middleindex:end),magnetization(middleindex:end),newDescendingField,'linear');
interpolatedMagnetization=[newDescendingMagnetization,newAscendingMagnetization];
interpolatedField=[newDescendingField,newAscendingField];

end

