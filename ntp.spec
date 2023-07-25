Name:           ntp
Version:4.2.8p17
Release:        1%{?dist}
Summary:ntp

License:GPL
URL:https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2.8p17.tar.gz
Source0:%{name}-%{version}.tar.gz

BuildRequires:make 
#Requires:       

%description


%prep
%autosetup


%build
./bootstrap
./configure --enable-shared --prefix=$RPM_BUILD_ROOT
make


%install
rm -rf $RPM_BUILD_ROOT
make install

%files
/bin/calc_tickadj
/bin/ntp-keygen
/bin/ntp-wait
/bin/ntpd
/bin/ntpdate
/bin/ntpdc
/bin/ntpq
/bin/ntptime
/bin/ntptrace
/bin/sntp
/bin/tickadj
/bin/update-leap
/share/doc/ntp/*
/share/doc/sntp/*
/share/man/man1/*
/share/man/man5/*
/share/ntp/*
/usr/lib/debug/*
#%license add-license-file-here
#%doc add-docs-here



%changelog
* Tue Jul 25 2023 root
- 
