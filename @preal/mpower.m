function p3 = mpower(p1,p2)
%PREAL/MPOWER Overloaded mpower (^) operator for class preal.
% Note: preal/mpower is the same as preal/power.

global useUnitsFlag

if ~(useUnitsFlag) % If physunits is disabled...
    p3=mpower(double(p1),double(p2)); % ... treat as double.
    return
end

p1=preal(p1);
p2=preal(p2);
tol=0.001;
if isscalar(p1)
    p1=preal(p1.value*ones(size(p2)),p1.units);
elseif isscalar(p2)
    p2=preal(p2.value*ones(size(p1)),p2.units);
elseif ndims(p1)==ndims(p2)&size(p1)==size(p2)
    % do nothing
else
    error('Array dimensions must agree')
end
p3=preal(ones(size(p1)));
for k=1:numel(p1)
    if any(abs(p2(k).units)>tol)
        error('Exponent must be non-dimensional (pure) number')
    end
    p3(k).value=p1(k).value^p2(k).value;
    p3(k).units=p1(k).units*p2(k).value;
end