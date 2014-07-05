soa-aur
=======

Squeeze on Arch (SOA) Arch User Repository

Repository for building Squeeze applications on Arch Linux

This repository is made available free of charge for
non-commercial private use. Any commercial usage is strictly
prohibited.

SQUEEZE ON ARCH IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
WARRANTIES ARE DISCLAIMED. IN NO EVENT SHALL THE SOFTWARE PROVIDER BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Use of Squeeze on Arch is at your own risk.


# Instructions for initial installation:

1) Install a base Linux Arch installtion on your machine and connect to it as root (using ssh or otherwise)

2) Update the base software and install minimal files to build applications:

pacman -Syu --noconfirm

pacman -S --noconfirm git base-devel

3) Clone the soa-aur files and start installation

git clone https://github.com/SqueezeOnArch/soa-aur.git

cd soa-aur

./soa-install.sh

(this will take several minutes to download and build the applications for your device)

4) If you wish to install Logitech Media Server:

./soa-install-lms-7.8.sh

or

./soa-install-lms-7.9.sh

depending on which version of LMS you wish to install.

(this will take up to an hour depending on the performance of your machine)

5) If you wish to install a custom kernel for added features (currently only for wandboard to support additional spdif rates):

./soa-install-wand-kernel.sh

(this will take up to an hour depending on the performance of your machine)

6) try to connect to the device using a web browser to see the configuration interface


# Updates:

You may wish to run the following to update your arch system:

pacman -Syu --noconfirm

To update all of the installed SoA components:

./soa-update-all.sh

