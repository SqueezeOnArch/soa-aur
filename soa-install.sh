#!/bin/bash

echo "Squeeze on Arch Installer (run as root)"
echo
echo "SQUEEZE ON ARCH IS PROVIDED 'AS IS' AND ANY EXPRESS OR IMPLIED"
echo "WARRANTIES ARE DISCLAIMED. IN NO EVENT SHALL THE SOFTWARE PROVIDER BE"
echo "LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR"
echo "CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF"
echo "SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR"
echo "BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,"
echo "WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE"
echo "OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN"
echo "IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
echo

while true; do
    read -p "Do you agree to the above and wish to continue? " yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo

cd libsoxr
makepkg --asroot -c -i -f -s --noconfirm
cd ..

cd turbolua
makepkg --asroot -c -i -f -s --noconfirm
cd ..

cd squeezelite
makepkg --asroot -c -i -f -s --noconfirm
cd ..

cd jivelite
makepkg --asroot -c -i -f -s --noconfirm
cd ..

cd jivelite-autologin
makepkg --asroot -c -i -f -s --noconfirm
cd ..

cd soa-web
makepkg --asroot -c -i -f -s --noconfirm
cd ..
